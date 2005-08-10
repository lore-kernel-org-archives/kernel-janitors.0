From: Rene Herman <rene.herman@keyaccess.nl>
Date: Wed, 10 Aug 2005 23:03:14 +0000
Subject: [KJ] Re: Log2 all through the kernel?
Message-Id: <42FA87B2.1020406@keyaccess.nl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============022968210427982028=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1123689284.5437.10.camel@localhost.localdomain>
In-Reply-To: <1123689284.5437.10.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============022968210427982028==
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Erik Mouw wrote:

> On Wed, Aug 10, 2005 at 05:54:44PM +0200, Oliver Korpilla wrote:
> 
>>Wouldn't it be more sensible to supply one portable one, with bit
>>shifts, and people with a need for O(1) timing could implement it using
>>an array?
> 
> 
> Send a patch to the linux-kernel mailing list and see what happens.

Sticking a few defines in a header somewhere should do, I believe:

#define floor_log2(x) (fls(x) - 1)
#define ceil_log2(x) (fls((x) - 1)

fls() is both defined in the kernel and a gcc builtin.

Rene.

--===============022968210427982028==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============022968210427982028==--
