From: Felipe W Damasio <felipewd@terra.com.br>
Date: Tue, 20 Jul 2004 16:42:28 +0000
Subject: Re: [Kernel-janitors] Re: [PATCH] nbd: replace schedule_timeout()
Message-Id: <40FD4B74.9070501@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============55905447958488041=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040720130244.GE27492@atrey.karlin.mff.cuni.cz>
In-Reply-To: <20040720130244.GE27492@atrey.karlin.mff.cuni.cz>
To: kernel-janitors@vger.kernel.org

--===============55905447958488041==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

	Hi,

Nishanth Aravamudan wrote:
> After discussing with Greg, longer delays were considered those
> measurable in milliseconds. I think msleep() helps add a layer of
> consistency across the board. It also is (IMO) easier to think of times
> and delays in terms of seconds / milliseconds rather than jiffies (this
> becomes very apparent in later patches, where all sorts of crazy
> conversions are replaced with simple numbers).

	Yeah, you're right, msleep seems to be the right way to go.

	Cheers,

Felipe
-- 
It's most certainly GNU/Linux, not Linux. Read more at
http://www.gnu.org/gnu/why-gnu-linux.html

--===============55905447958488041==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============55905447958488041==--
