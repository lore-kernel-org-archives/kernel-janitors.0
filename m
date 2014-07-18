From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Fri, 18 Jul 2014 15:30:45 +0000
Subject: [PATCH 1/5] tools/power/cpupower/utils/helpers/sysfs.c: drop negativity check on unsigned value
Message-Id: <1405697445-23620-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: dcb314@hotmail.com, rafael.j.wysocki@intel.com, trenn@suse.de, linux@dominikbrodowski.net, Andrey Utkin <andrey.krieger.utkin@gmail.com>

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80621
Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
---
 tools/power/cpupower/utils/helpers/sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/power/cpupower/utils/helpers/sysfs.c b/tools/power/cpupo=
wer/utils/helpers/sysfs.c
index 851c7a1..09afe5d 100644
--- a/tools/power/cpupower/utils/helpers/sysfs.c
+++ b/tools/power/cpupower/utils/helpers/sysfs.c
@@ -81,7 +81,7 @@ int sysfs_is_cpu_online(unsigned int cpu)
 	close(fd);
=20
 	value =3D strtoull(linebuf, &endp, 0);
-	if (value > 1 || value < 0)
+	if (value > 1)
 		return -EINVAL;
=20
 	return value;
--=20
1.8.5.5

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
