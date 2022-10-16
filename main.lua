local GlobalHandler = {} GlobalHandler.__index = GlobalHandler

local genv = getgenv()

function GlobalHandler:Init(Name) 
    local self = genv[Name] or setmetatable({}, GlobalHandler)
    self.Name = Name or "PerthENV"
    self.ContentURL = "https://raw.githubusercontent.com/Perthys/PerthPackage/main/Packages/%s.lua"
    self.Cache = {}
    local Cache = self.Cache;
    
    if getgenv then
        if not getgenv()[Name] then
            genv[Name] = self;
        end
    end
    
    local function import(Name)
        assert(Name, ("Expected [string] got [nil]"))
        assert(type(Name) == "string", ("Expected [string] got [%s]"):format(type(Name)))

        local Get, Result = pcall(game.HttpGet, game, self.ContentURL:format(Name:lower()));
        
        if Get and Result and #Result ~= 0 then
            Cache.CurrentImport = loadstring(Result)();
            
            return
        else
            local Get, Result = pcall(game.HttpGet, game, Name);
            
            if Get and Result and #Result ~= 0 then
                Cache.CurrentImport = loadstring(Result)()
                return
            end
        end
        
        error "Link or Name is a invalid package"
    end

    local function as(Name)
        if not Cache.CurrentImport then
            error("Cannot use [as] statement witout import")
        end

        if genv[Name] then
            error (("%s is already designated as a package choose another name"):format(Name))
        end
        genv[Name] = Cache.CurrentImport
    end
    
    genv.import = import;
    genv.as = as;

    return self;
end

return GlobalHandler
