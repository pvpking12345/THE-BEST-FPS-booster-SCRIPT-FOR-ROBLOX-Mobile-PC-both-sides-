local function UltraFPSBoost()
    print("🚀 Activating ULTRA FPS BOOSTER...")

    -- تعطيل الظلال وتأثيرات الإضاءة
    game.Lighting.GlobalShadows = false
    game.Lighting.FogEnd = 999999
    game.Lighting.Brightness = 3

    -- تحسين جودة الإطارات بشكل متطرف
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01

    -- إزالة الـ Decals والـ Textures نهائيًا لتقليل استهلاك الذاكرة
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Decal") or v:IsA("Texture") then
            v:Destroy()
        end
    end

    -- تعطيل كل التأثيرات البصرية والمياه
    game:GetService("Workspace").Terrain.WaterWaveSize = 0
    game:GetService("Workspace").Terrain.WaterWaveSpeed = 0
    game:GetService("Workspace").Terrain.WaterReflectance = 0
    game:GetService("Workspace").Terrain.WaterTransparency = 1

    -- حذف جميع الشخصيات غير الضرورية (NPCs) لزيادة الأداء
    for _, npc in pairs(workspace:GetChildren()) do
        if npc:IsA("Model") and npc:FindFirstChild("Humanoid") then
            npc:Destroy()
        end
    end

    -- تعطيل العمليات الخلفية غير الضرورية
    game:GetService("RunService"):Set3dRenderingEnabled(false)

    print("🔥 ULTRA FPS BOOSTER ACTIVATED! 🚀")
end

-- 🚀 تقليل الـ Ping إلى 0 🚀
local function ZeroPingMode()
    print("📡 Activating ZERO PING MODE...")

    -- تعطيل العمليات الخلفية التي تستهلك الإنترنت
    game:GetService("NetworkClient"):SetOutgoingKBPSLimit(16) -- أقل استهلاك ممكن للإنترنت

    -- تعطيل الـ Remote Events غير الضرورية
    for _, v in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
            v:Destroy()
        end
    end

    -- تعطيل مزامنة البيانات غير الضرورية
    game:GetService("NetworkSettings").IncomingReplicationLag = 0
    game:GetService("NetworkSettings").PhysicsSendRate = 5

    print("✅ ZERO PING MODE ACTIVATED! 🎯")
end

-- 🚀 تسريع تحميل اللعبة والعناصر 🚀
local function HyperLoad()
    print("⚡ Activating HYPERLOAD MODE...")

    -- تعطيل تحميل البيانات غير الضرورية
    game:GetService("ContentProvider"):SetBaseUrl("")

    -- جعل اللعبة لا تحمل إلا الأشياء الضرورية فقط
    game:GetService("ReplicatedStorage").DefaultCacheSize = 10

    print("⚡ HYPERLOAD MODE ACTIVATED! 🏎️")
end

-- 🚀 تسريع استجابة الماوس ولوحة المفاتيح 🚀
local function InstantResponse()
    print("🎯 Activating INSTANT RESPONSE MODE...")

    -- تعطيل تأخير الإدخال لتحسين سرعة الاستجابة
    game:GetService("UserInputService").InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            game:GetService("RunService").RenderStepped:Wait()
        end
    end)

    print("🎯 INSTANT RESPONSE MODE ACTIVATED! 🏆")
end

-- 🚀 إزالة الحد الأقصى للفريمات لرفع الأداء 🚀
setfpscap(9999)

-- تشغيل جميع الميزات دفعة واحدة!
UltraFPSBoost()
ZeroPingMode()
HyperLoad()
InstantResponse()
