From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Mon, 07 Jul 2008 19:24:14 +0000
Subject: [PATCH] crypto/tcrypt.c fix resource leak
Message-Id: <1215458654.8316.16.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel Janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, herbert@gondor.apana.org.au, davem@davemloft.net, linux-crypto@vger.kernel.org, jmorris@interco

G'day people,

Coverity CID: 2306 & 2307 RESOURCE_LEAK

In the second for loop in test_cipher(), data is allocated space with
kzalloc() and is only ever freed in an error case.
Looking at this loop, data is written to this memory but nothing seems
to read from it.=20
So here is a patch removing the allocation, I think this is the right
fix.

Only compile tested.

=EF=BB=BFSigned-off-by: Darren Jenkins <darrenrjenkins@gmailcom>

diff --git a/crypto/tcrypt.c b/crypto/tcrypt.c
index 6beabc5..e47f6e0 100644
--- a/crypto/tcrypt.c
+++ b/crypto/tcrypt.c
@@ -586,12 +586,6 @@ static void test_cipher(char *algo, int enc,
 	j =3D 0;
 	for (i =3D 0; i < tcount; i++) {
=20
-		data =3D kzalloc(template[i].ilen, GFP_KERNEL);
-		if (!data)
-			continue;
-
-		memcpy(data, template[i].input, template[i].ilen);
-
 		if (template[i].iv)
 			memcpy(iv, template[i].iv, MAX_IVLEN);
 		else
@@ -613,10 +607,8 @@ static void test_cipher(char *algo, int enc,
 				printk("setkey() failed flags=3D%x\n",
 						crypto_ablkcipher_get_flags(tfm));
=20
-				if (!template[i].fail) {
-					kfree(data);
+				if (!template[i].fail)
 					goto out;
-				}
 			}
=20
 			temp =3D 0;


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
