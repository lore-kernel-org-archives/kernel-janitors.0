From: Felipe W Damasio <felipewd@terra.com.br>
Date: Tue, 20 Jul 2004 13:10:31 +0000
Subject: Re: [Kernel-janitors] Re: [PATCH] nbd: replace schedule_timeout()
Message-Id: <40FD19C7.4000602@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62024461260719221=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040720130244.GE27492@atrey.karlin.mff.cuni.cz>
In-Reply-To: <20040720130244.GE27492@atrey.karlin.mff.cuni.cz>
To: kernel-janitors@vger.kernel.org

--===============62024461260719221==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



Pavel Machek wrote:
> I'm not sure it makes sense.... so it will just spin once more? Exact
> timeout does not seem too critical here.

	So why not use HZ instead of 1000?

Felipe
-- 
It's most certainly GNU/Linux, not Linux. Read more at
http://www.gnu.org/gnu/why-gnu-linux.html

--===============62024461260719221==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62024461260719221==--
