using BepInEx;

namespace Ifrit_KR67.FCS.Dev
{
	// Dev/debug unlock for the KR-67 Ifrit FCS. No code of its own: when it is loaded, the FCS binds every setting other
	// than the player ones to BepInEx/config/Ifrit_KR67.FCS.Dev.cfg and shows them in the ConfigurationManager (F1).
	[BepInPlugin("Ifrit_KR67.FCS.Dev", "KR-67 Ifrit FCS - Dev/Debug settings", "0.3.2")]
	public class FcsDevPlugin : BaseUnityPlugin
	{
		private void Awake()
		{
			base.Logger.LogInfo("Ifrit FCS dev/debug settings unlocked.");
		}
	}
}
