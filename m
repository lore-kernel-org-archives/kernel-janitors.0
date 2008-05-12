From: Simon Holm =?ISO-8859-1?Q?Th=F8gersen?= <odie@cs.aau.dk>
Date: Mon, 12 May 2008 15:40:50 +0000
Subject: [PATCH] Remove NULL pointer check for argument never passed as
Message-Id: <1210606850.25310.14.camel@odie.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0805121536370.3694@ask.diku.dk>
	 <1210603050.25310.9.camel@odie.local>
	 <Pine.LNX.4.64.0805121637180.3694@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0805121637180.3694@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>
Cc: tony.luck@intel.com, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is only palinfo_handle_smp as (indirect) user of palinfo_smp_call (by
way of smp_call_function_single) and surely palinfo_handle_smp never pass
NULL as parameter for info.

Signed-off-by: Simon Holm Th=C3=B8gersen <odie@cs.aau.dk>
---
 arch/ia64/kernel/palinfo.c |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/arch/ia64/kernel/palinfo.c b/arch/ia64/kernel/palinfo.c
index 4547a20..9dc00f7 100644
--- a/arch/ia64/kernel/palinfo.c
+++ b/arch/ia64/kernel/palinfo.c
@@ -900,12 +900,6 @@ static void
 palinfo_smp_call(void *info)
 {
 	palinfo_smp_data_t *data =3D (palinfo_smp_data_t *)info;
-	if (data =3D NULL) {
-		printk(KERN_ERR "palinfo: data pointer is NULL\n");
-		data->ret =3D 0; /* no output */
-		return;
-	}
-	/* does this actual call */
 	data->ret =3D (*data->func)(data->page);
 }
=20
--=20
1.5.5.1.125.gc697a

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
