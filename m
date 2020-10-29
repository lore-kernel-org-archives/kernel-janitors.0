From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 29 Oct 2020 11:44:25 +0000
Subject: [PATCH] MAINTAINERS: rectify DELL WMI SYSMAN DRIVERS section
Message-Id: <20201029114425.22520-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Divya Bharathi <divya.bharathi@dell.com>, Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
Cc: Mario Limonciello <mario.limonciello@dell.com>, Prasanth KSR <prasanth.ksr@dell.com>, Joe Perches <joe@perches.com>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit e8a60aa7404b ("platform/x86: Introduce support for Systems
Management Driver over WMI for Dell Systems") added a new section
DELL WMI SYSMAN DRIVERS in MAINTAINERS, but slipped in a typo.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches    F:    drivers/platform/x86/dell-wmi-syman/*

Point the file entry to the right location and add an entry for its
Documentation while at it.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Divya, please ack.

Hans, please pick this minor non-urgent patch into your -next x86 platform
driver tree on top of commit mentioned above.

 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b8a905354ee9..a0a86daa9c51 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4974,7 +4974,8 @@ M:	Mario Limonciello <mario.limonciello@dell.com>
 M:	Prasanth Ksr <prasanth.ksr@dell.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	drivers/platform/x86/dell-wmi-syman/*
+F:	Documentation/ABI/testing/sysfs-class-firmware-attributes
+F:	drivers/platform/x86/dell-wmi-sysman/
 
 DELL WMI NOTIFICATIONS DRIVER
 M:	Matthew Garrett <mjg59@srcf.ucam.org>
-- 
2.17.1
