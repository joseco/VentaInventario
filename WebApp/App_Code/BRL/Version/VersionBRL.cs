using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for VersionBRL
/// </summary>
public class VersionBRL
{
    public VersionBRL()
    {
       
    }

    public static VersionInfo GetVersionInfo()
    {
        int? versionMayor = null;
        int? versionMenor = null;
        int? patch = null;
        VersionDSTableAdapters.VersionTableAdapter adapter = new VersionDSTableAdapters.VersionTableAdapter();
        adapter.GetVersionInfo(ref versionMayor, ref versionMenor, ref patch);

        if (versionMayor == null || versionMenor == null || patch == null)
            throw new Exception("La informacion de la version no esta definida para la base de datos");

        return new VersionInfo()
        {
            VersionMayor = versionMayor.Value,
            VersionMenor = versionMenor.Value,
            Patch = patch.Value
        };
    }
}