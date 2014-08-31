From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Date: Sun, 31 Aug 2014 20:58:50 +0000
Subject: Re: [PATCH] checkpatch: Remove unnecessary + after {8,8}
Message-Id: <7d350fb4-2a54-4b3f-b81c-6c0737ff32fb@BY2FFO11FD028.protection.gbl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405128087.6751.12.camel@joe-AO725>
	<20140712013927.GA30781@kroah.com> <1405129612.6751.24.camel@joe-AO725>
	<20140712020114.GA12301@kroah.com> <20140712020520.GA18611@kroah.com>
	<1405130970.6751.37.camel@joe-AO725>
In-Reply-To: <1405130970.6751.37.camel@joe-AO725>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernelnewbies@lists.kernelnewbies.org

Hi Joe,

On Fri, 2014-07-11 at 07:09PM -0700, Joe Perches wrote:
> There's a useless "+" use that needs to be removed as perl 5.20
> emits a "Useless use of greediness modifier '+'" message each
> time it's hit.

I saw this Perl warning today as well and wondered whether this patch is
coming or not. Apparently it's not in linux-next (yet).

	Thanks,
	S=C3=B6ren
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
