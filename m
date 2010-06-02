From: Kulikov Vasiliy <segooon@gmail.com>
Date: Wed, 02 Jun 2010 13:12:44 +0000
Subject: [PATCH] staging: xgifb: Fix compiler warnings about unused
Message-Id: <1275484364.16039.10.camel@shinshilla>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fix compiler warnings about unused variables and functions on
CONFIG_FB_XGI=m.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

diff --git a/drivers/staging/xgifb/XGI_main.h
b/drivers/staging/xgifb/XGI_main.h
index 4f4171e..dd6d6bd 100644
--- a/drivers/staging/xgifb/XGI_main.h
+++ b/drivers/staging/xgifb/XGI_main.h
@@ -388,7 +388,6 @@ static int currcon = 0;
static int XGIfb_registered;
static int XGIfb_tvmode = 0;
static int XGIfb_mem = 0;
-static int XGIfb_pdc = 0;
static int enable_dstn = 0;
static int XGIfb_ypan = -1;

diff --git a/drivers/staging/xgifb/XGI_main_26.c
b/drivers/staging/xgifb/XGI_main_26.c
index 867012b..4e3af91 100644
--- a/drivers/staging/xgifb/XGI_main_26.c
+++ b/drivers/staging/xgifb/XGI_main_26.c
@@ -855,6 +855,7 @@ static int XGIfb_validate_mode(int myindex)

}

+#ifndef MODULE
static void XGIfb_search_crt2type(const char *name)
{
int i = 0;
@@ -873,7 +874,9 @@ static void XGIfb_search_crt2type(const char *name)
if(XGIfb_crt2type < 0)
printk(KERN_INFO "XGIfb: Invalid CRT2 type: %s\n", name);
}
+#endif

+#ifndef MODULE
static void XGIfb_search_queuemode(const char *name)
{
int i = 0;
@@ -891,6 +894,7 @@ static void XGIfb_search_queuemode(const char *name)
if (XGIfb_queuemode < 0)
printk(KERN_INFO "XGIfb: Invalid queuemode type: %s\n", name);
}
+#endif

static u8 XGIfb_search_refresh_rate(unsigned int rate)
{
@@ -938,6 +942,7 @@ static u8 XGIfb_search_refresh_rate(unsigned int
rate)
}
}

+#ifndef MODULE
static void XGIfb_search_tvstd(const char *name)
{
int i = 0;
@@ -953,6 +958,7 @@ static void XGIfb_search_tvstd(const char *name)
i++;
}
}
+#endif

static BOOLEAN XGIfb_bridgeisslave(void)
{
@@ -2824,6 +2830,7 @@ static void XGIfb_post_setmode(void)
XGIINITSTATIC int __init XGIfb_setup(char *options)
{
char *this_opt;
+ int XGIfb_pdc;



@@ -3585,7 +3592,6 @@ module_init(xgifb_init);
static char         *mode = NULL;
static int          vesa = 0;
static unsigned int rate = 0;
-static unsigned int crt1off = 1;
static unsigned int mem = 0;
static char         *forcecrt2type = NULL;
static int          forcecrt1 = -1;
-- 
1.7.0.4



