From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 17 Dec 2020 07:15:01 +0000
Subject: [PATCH] MAINTAINERS: include governors into CPU IDLE TIME MANAGEMENT FRAMEWORK
Message-Id: <20201217071501.31267-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

The current pattern in the file entry does not make the files in the
governors subdirectory to be a part of the CPU IDLE TIME MANAGEMENT
FRAMEWORK.

Adjust the file pattern to include files in governors.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20201215

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 952731d1e43c..ac679aa00e0d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4596,7 +4596,7 @@ B:	https://bugzilla.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git
 F:	Documentation/admin-guide/pm/cpuidle.rst
 F:	Documentation/driver-api/pm/cpuidle.rst
-F:	drivers/cpuidle/*
+F:	drivers/cpuidle/
 F:	include/linux/cpuidle.h
 
 CPU POWER MONITORING SUBSYSTEM
-- 
2.17.1
