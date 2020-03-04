From: Walter Harms <wharms@bfs.de>
Date: Wed, 04 Mar 2020 21:28:31 +0000
Subject: AW: [PATCH 5.5 110/176] MIPS: VPE: Fix a double free and a memory leak in release_vpe()
Message-Id: <adf1859b4dcc497285ebbda017ece22d@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200303174304.593872177@linuxfoundation.org>,<20200303174317.555620066@linuxfoundation.org>
In-Reply-To: <20200303174317.555620066@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Paul Burton <paulburton@kernel.org>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>


________________________________________
Von: kernel-janitors-owner@vger.kernel.org <kernel-janitors-owner@vger.kern=
el.org> im Auftrag von Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Gesendet: Dienstag, 3. M=E4rz 2020 18:42
An: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman; stable@vger.kernel.org; Christophe JAILLET; Paul Bu=
rton; ralf@linux-mips.org; linux-mips@vger.kernel.org; kernel-janitors@vger=
.kernel.org
Betreff: [PATCH 5.5 110/176] MIPS: VPE: Fix a double free and a memory leak=
 in release_vpe()

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

commit bef8e2dfceed6daeb6ca3e8d33f9c9d43b926580 upstream.

Pointer on the memory allocated by 'alloc_progmem()' is stored in
'v->load_addr'. So this is this memory that should be freed by
'release_progmem()'.

'release_progmem()' is only a call to 'kfree()'.

With the current code, there is both a double free and a memory leak.
Fix it by passing the correct pointer to 'release_progmem()'.

Fixes: e01402b115ccc ("More AP / SP bits for the 34K, the Malta bits and th=
ings. Still wants")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Paul Burton <paulburton@kernel.org>
Cc: ralf@linux-mips.org
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 arch/mips/kernel/vpe.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/mips/kernel/vpe.c
+++ b/arch/mips/kernel/vpe.c
@@ -134,7 +134,7 @@ void release_vpe(struct vpe *v)
 {
        list_del(&v->list);
        if (v->load_addr)
-               release_progmem(v);
+               release_progmem(v->load_addr);
        kfree(v);
 }


since release_progmem() is kfree() it is also possible to drop "if (v->load=
_addr)"

jm2c

re,
 wh
