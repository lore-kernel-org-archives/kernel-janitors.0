From: aLeJ <fuzzy.alej@gmail.com>
Date: Thu, 30 Jun 2005 08:28:58 +0000
Subject: [KJ] fs/smbfs/proc.c -> replace direct assignment with
Message-Id: <1120126379.24539.3.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1120126573.24539.6.camel@localhost>
In-Reply-To: <1120126573.24539.6.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Description:
Use __set_current_state() instead of using a direct assignment

Signed-off-by: Alejandro Andr=E9s <fuzzy.alej@gmail.com>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
