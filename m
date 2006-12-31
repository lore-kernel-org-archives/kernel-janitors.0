From: "=?ISO-8859-1?Q?Daniel_Marjam=E4ki?=" <daniel.marjamaki@gmail.com>
Date: Sun, 31 Dec 2006 16:37:05 +0000
Subject: [KJ] [PATCH] net/core/flow.c: compare data with memcmp
Message-Id: <80ec54e90612310837y786fd764oc18bf37c8f0b2b8c@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netdev@vger.kernel.org
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

From: Daniel Marjam=E4ki
This has been tested by me.
Signed-off-by: Daniel Marjam=E4ki <daniel.marjamaki@gmail.com>
--- linux-2.6.20-rc2/net/core/flow.c	2006-12-27 09:59:56.000000000 +0100
+++ linux/net/core/flow.c	2006-12-31 18:26:06.000000000 +0100
@@ -144,29 +144,16 @@ typedef u32 flow_compare_t;

 extern void flowi_is_missized(void);

-/* I hear what you're saying, use memcmp.  But memcmp cannot make
- * important assumptions that we can here, such as alignment and
- * constant size.
- */
 static int flow_key_compare(struct flowi *key1, struct flowi *key2)
 {
-	flow_compare_t *k1, *k1_lim, *k2;
-	const int n_elem =3D sizeof(struct flowi) / sizeof(flow_compare_t);
-
 	if (sizeof(struct flowi) % sizeof(flow_compare_t))
 		flowi_is_missized();

-	k1 =3D (flow_compare_t *) key1;
-	k1_lim =3D k1 + n_elem;
-
-	k2 =3D (flow_compare_t *) key2;
-
-	do {
-		if (*k1++ !=3D *k2++)
-			return 1;
-	} while (k1 < k1_lim);
+	/* Number of elements to compare */
+	const int n_elem =3D sizeof(struct flowi) / sizeof(flow_compare_t);

-	return 0;
+	/* Compare all elements in key1 and key2. */
+	return memcmp(key1, key2, n_elem * sizeof(flow_compare_t));
 }

 void *flow_cache_lookup(struct flowi *key, u16 family, u8 dir,

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
