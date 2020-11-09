From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 09 Nov 2020 09:19:42 +0000
Subject: [PATCH] MAINTAINERS: rectify file patterns for NETFILTER
Message-Id: <20201109091942.32280-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

The two file patterns in the NETFILTER section:

  F:      include/linux/netfilter*
  F:      include/uapi/linux/netfilter*

intended to match the directories:

  ./include{/uapi}/linux/netfilter_{arp,bridge,ipv4,ipv6}

A quick check with ./scripts/get_maintainer.pl --letters -f will show that
they are not matched, though, because this pattern only matches files, but
not directories.

Rectify the patterns to match the intended directories.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on v5.10-rc3 and next-20201109

Pablo, Jozsef, Florian, please pick this minor non-urgent clean-up patch.

 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cba8ddf87a08..572a064a9c95 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12139,10 +12139,10 @@ W:	http://www.nftables.org/
 Q:	http://patchwork.ozlabs.org/project/netfilter-devel/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf.git
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf-next.git
-F:	include/linux/netfilter*
+F:	include/linux/netfilter*/
 F:	include/linux/netfilter/
 F:	include/net/netfilter/
-F:	include/uapi/linux/netfilter*
+F:	include/uapi/linux/netfilter*/
 F:	include/uapi/linux/netfilter/
 F:	net/*/netfilter.c
 F:	net/*/netfilter/
-- 
2.17.1
