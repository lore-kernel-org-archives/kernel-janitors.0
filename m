From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 01 Aug 2017 16:27:27 +0000
Subject: [PATCH 0/2] Revert "ipv6: constify inet6_protocol structures"
Message-Id: <1501604849-19443-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: kernel-janitors@vger.kernel.org, bhumirks@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

inet6_add_protocol and inet6_del_protocol include casts that remove the
effect of the const annotation on their parameter, leading to possible
runtime crashes.
