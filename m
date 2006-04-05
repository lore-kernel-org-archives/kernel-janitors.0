From: Patrick McHardy <kaber@trash.net>
Date: Wed, 05 Apr 2006 22:00:04 +0000
Subject: [KJ] Re: fix kbuild warning in iptable_nat.o
Message-Id: <44343DE4.70500@trash.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37415515752613615=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1143719875.8469.14.camel@localhost.localdomain>
In-Reply-To: <1143719875.8469.14.camel@localhost.localdomain>
To: Darren Jenkins <darrenrjenkins@gmail.com>
Cc: kernel Janitors <kernel-janitors@lists.osdl.org>, "Randy.Dunlap" <rdunlap@xenotime.net>, netfilter-devel@lists.netfilter.org

--===============37415515752613615==
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Darren Jenkins\ wrote:
> G'day list
> 
> There are a couple of Kbuild warnings in net/ipv4/netfilter/ that would
> be nice to get rid of.
> 
> WARNING: net/ipv4/netfilter/ip_conntrack.o - Section mismatch: reference
> to .init.text:ip_conntrack_init from .text between 'init_or_cleanup' (at
> offset 0x7ea) and '__hash_conntrack'
> WARNING: net/ipv4/netfilter/iptable_nat.o - Section mismatch: reference
> to .init.text:ip_nat_rule_init from .text between 'init_or_cleanup' (at
> offset 0x455) and 'nat_decode_session'
> 
> I have a patch for the 'iptable_nat.o' warning below, and I was just
> wanting to check in and see if any of you netfilter guys had a problem
> with this patch, or with me doing a similar patch for the
> 'ip_canntrack.o' warning.
> 
> 
> Any input would be welcome, thanks in advance :). 

I have a patch queued that just splits the init/cleanup parts.

--===============37415515752613615==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37415515752613615==--
