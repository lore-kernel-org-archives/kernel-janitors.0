From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 31 Jan 2021 07:54:45 +0000
Subject: [PATCH for -next] docs: hwmon: rectify table in max16601.rst
Message-Id: <20210131075445.21222-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 90b0f71d62df ("hwmon: (pmbus/max16601) Determine and use number of
populated phases") adjusts content in the table of
./Documentation/hwmon/max16601.rst, but one row went beyond the column's
length.

Hence, make htmldocs warns:

  Documentation/hwmon/max16601.rst:94: WARNING: Malformed table.

Adjust the column length of that table for this longer row to fit.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20210129

Guenter, please pick this minor fixup for your hwmon-next tree.

 Documentation/hwmon/max16601.rst | 143 +++++++++++++++----------------
 1 file changed, 71 insertions(+), 72 deletions(-)

diff --git a/Documentation/hwmon/max16601.rst b/Documentation/hwmon/max16601.rst
index d16792be7533..d265a2224354 100644
--- a/Documentation/hwmon/max16601.rst
+++ b/Documentation/hwmon/max16601.rst
@@ -53,75 +53,74 @@ Sysfs entries
 
 The following attributes are supported.
 
-============ ===========================-in1_label		"vin1"
-in1_input		VCORE input voltage.
-in1_alarm		Input voltage alarm.
-
-in2_label		"vout1"
-in2_input		VCORE output voltage.
-in2_alarm		Output voltage alarm.
-
-curr1_label		"iin1"
-curr1_input		VCORE input current, derived from duty cycle and output
-			current.
-curr1_max		Maximum input current.
-curr1_max_alarm		Current high alarm.
-
-curr[P+2]_label		"iin1.P"
-curr[P+2]_input		VCORE phase P input current.
-
-curr[N+2]_label		"iin2"
-curr[N+2]_input		VCORE input current, derived from sensor element.
-			'N' is the number of enabled/populated phases.
-
-curr[N+3]_label		"iin3"
-curr[N+3]_input		VSA input current.
-
-curr[N+4]_label		"iout1"
-curr[N+4]_input		VCORE output current.
-curr[N+4]_crit		Critical output current.
-curr[N+4]_crit_alarm	Output current critical alarm.
-curr[N+4]_max		Maximum output current.
-curr[N+4]_max_alarm	Output current high alarm.
-
-curr[N+P+5]_label	"iout1.P"
-curr[N+P+5]_input	VCORE phase P output current.
-
-curr[2*N+5]_label	"iout3"
-curr[2*N+5]_input	VSA output current.
-curr[2*N+5]_highest	Historical maximum VSA output current.
-curr[2*N+5]_reset_history
-			Write any value to reset curr21_highest.
-curr[2*N+5]_crit	Critical output current.
-curr[2*N+5]_crit_alarm	Output current critical alarm.
-curr[2*N+5]_max		Maximum output current.
-curr[2*N+5]_max_alarm	Output current high alarm.
-
-power1_label		"pin1"
-power1_input		Input power, derived from duty cycle and output current.
-power1_alarm		Input power alarm.
-
-power2_label		"pin2"
-power2_input		Input power, derived from input current sensor.
-
-power3_label		"pout"
-power3_input		Output power.
-
-temp1_input		VCORE temperature.
-temp1_crit		Critical high temperature.
-temp1_crit_alarm	Chip temperature critical high alarm.
-temp1_max		Maximum temperature.
-temp1_max_alarm		Chip temperature high alarm.
-
-temp2_input		TSENSE_0 temperature
-temp3_input		TSENSE_1 temperature
-temp4_input		TSENSE_2 temperature
-temp5_input		TSENSE_3 temperature
-
-temp6_input		VSA temperature.
-temp6_crit		Critical high temperature.
-temp6_crit_alarm	Chip temperature critical high alarm.
-temp6_max		Maximum temperature.
-temp6_max_alarm		Chip temperature high alarm.
-============ ===========================+============= ===========================+in1_label		  "vin1"
+in1_input		  VCORE input voltage.
+in1_alarm		  Input voltage alarm.
+
+in2_label		  "vout1"
+in2_input		  VCORE output voltage.
+in2_alarm		  Output voltage alarm.
+
+curr1_label		  "iin1"
+curr1_input		  VCORE input current, derived from duty cycle and output
+			  current.
+curr1_max		  Maximum input current.
+curr1_max_alarm		  Current high alarm.
+
+curr[P+2]_label		  "iin1.P"
+curr[P+2]_input		  VCORE phase P input current.
+
+curr[N+2]_label		  "iin2"
+curr[N+2]_input		  VCORE input current, derived from sensor element.
+			  'N' is the number of enabled/populated phases.
+
+curr[N+3]_label		  "iin3"
+curr[N+3]_input		  VSA input current.
+
+curr[N+4]_label		  "iout1"
+curr[N+4]_input		  VCORE output current.
+curr[N+4]_crit		  Critical output current.
+curr[N+4]_crit_alarm	  Output current critical alarm.
+curr[N+4]_max		  Maximum output current.
+curr[N+4]_max_alarm	  Output current high alarm.
+
+curr[N+P+5]_label	  "iout1.P"
+curr[N+P+5]_input	  VCORE phase P output current.
+
+curr[2*N+5]_label	  "iout3"
+curr[2*N+5]_input	  VSA output current.
+curr[2*N+5]_highest	  Historical maximum VSA output current.
+curr[2*N+5]_reset_history Write any value to reset curr21_highest.
+curr[2*N+5]_crit	  Critical output current.
+curr[2*N+5]_crit_alarm	  Output current critical alarm.
+curr[2*N+5]_max		  Maximum output current.
+curr[2*N+5]_max_alarm	  Output current high alarm.
+
+power1_label		  "pin1"
+power1_input		  Input power, derived from duty cycle and output current.
+power1_alarm		  Input power alarm.
+
+power2_label		  "pin2"
+power2_input		  Input power, derived from input current sensor.
+
+power3_label		  "pout"
+power3_input		  Output power.
+
+temp1_input		  VCORE temperature.
+temp1_crit		  Critical high temperature.
+temp1_crit_alarm	  Chip temperature critical high alarm.
+temp1_max		  Maximum temperature.
+temp1_max_alarm		  Chip temperature high alarm.
+
+temp2_input		  TSENSE_0 temperature
+temp3_input		  TSENSE_1 temperature
+temp4_input		  TSENSE_2 temperature
+temp5_input		  TSENSE_3 temperature
+
+temp6_input		  VSA temperature.
+temp6_crit		  Critical high temperature.
+temp6_crit_alarm	  Chip temperature critical high alarm.
+temp6_max		  Maximum temperature.
+temp6_max_alarm		  Chip temperature high alarm.
+============= ===========================-- 
2.17.1
