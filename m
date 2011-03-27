From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Sun, 27 Mar 2011 16:22:22 +0000
Subject: Re: [PATCH v2] x86: page: get_order() optimization
Message-Id: <201103271822.22851.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1301215556-8898-1-git-send-email-mcsim.planeta@gmail.com> <20110327113323.GA27825@elte.hu>
In-Reply-To: <20110327113323.GA27825@elte.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Ingo Molnar <mingo@elte.hu>
Cc: Maksym Planeta <mcsim.planeta@gmail.com>, mingo@redhat.com, kernel-janitors@vger.kernel.org, namhyung@gmail.com, linux-kernel@vger.kernel.org

Am Sonntag 27 M=E4rz 2011, 13:33:23 schrieb Ingo Molnar:
>=20
> Just wondering, what's the before/after 'size vmlinux' effect on a 'make
> defconfig' x86 kernel? Does the optimization make the kernel smaller as
> well, besides making it faster?
>=20
> Thanks,
>=20
> 	Ingo
Hi,

I compiled Linus' Tree (40471856) on my x86_64 machine, once without the pa=
tch=20
and once with the patch.


size vmlinux-with*
   text    data     bss     dec     hex filename
7996901 1236036 1118208 10351145         9df229 vmlinux-withoutpatch
7996554 1235988 1118208 10350750         9df09e vmlinux-withpatch

ls -la vmlinux-with*
-rwxr-xr-x 1 peter users 18921237 27. M=E4r 17:40 vmlinux-withoutpatch
-rwxr-xr-x 1 peter users 18921333 27. M=E4r 17:58 vmlinux-withpatch



Peter=20

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
