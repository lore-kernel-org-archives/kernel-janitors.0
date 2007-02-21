From: "=?UTF-8?Q?H=C3=A5kon_L=C3=B8vdal?=" <hlovdal@gmail.com>
Date: Wed, 21 Feb 2007 14:45:33 +0000
Subject: Re: [KJ] BIT macro cleanup
Message-Id: <a01a16b50702210645s1dbef004tf532556c772b774d@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45CADD09.70809@bfs.de>
In-Reply-To: <45CADD09.70809@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 21/02/07, Milind Choudhary <milindchoudhary@gmail.com> wrote:> there are=
 some setbit & resetbit macros scattered here n there> e.g.> ./drivers/net/=
irda/Via-ircc.h>> #define SetBit(val,bit)  val=3D (unsigned char ) (val | (=
0x1 << bit))> // Sets bit to 1> #define ResetBit(val,bit) val=3D (unsigned =
char ) (val & ~(0x1 << bit))> // Sets bit to 0>> if we move these somewhere=
 near BIT>> #define SETBIT(data,mask)    (data |=3D mask)> #define RESETBIT=
(data,mask)    (data &=3D ~mask)
I would find the term "clear" to be better than "reset" in this context,i.e=
. SETBIT + CLEARBIT. Also, the macros are not neccessarilyrestricted to ope=
rate on a single bit so SETBITS + CLEARBITSwould probably be better.Maybe S=
ET_BITMASK + CLEAR_BITMASK also could be used.
BR H=E5kon L=F8vdal
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
