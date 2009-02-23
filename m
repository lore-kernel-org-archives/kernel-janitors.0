From: Jesper Dangaard Brouer <jdb@comx.dk>
Date: Mon, 23 Feb 2009 14:37:55 +0000
Subject: [PATCH 1/3] Doc: Fix typos in ip-sysctl.txt about rp_filter.
Message-Id: <1235399875.2351.48.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1235141957.2351.37.camel@localhost.localdomain>
	 <1235142193.2351.41.camel@localhost.localdomain>
	 <20090222.000656.74298101.davem@davemloft.net>
In-Reply-To: <20090222.000656.74298101.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org


First fix a typo in Stephens patch ;-)

Signed-off-by: Jesper Dangaard Brouer <hawk@comx.dk>
---

 Documentation/networking/ip-sysctl.txt |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)


diff --git a/Documentation/networking/ip-sysctl.txt b/Documentation/networking/ip-sysctl.txt
index 71041c2..e0b8c2c 100644
--- a/Documentation/networking/ip-sysctl.txt
+++ b/Documentation/networking/ip-sysctl.txt
@@ -711,8 +711,8 @@ rp_filter - INTEGER
 	    the packet check will fail.
 
         Current recommended practice in RFC3704 is to enable strict mode
-	to prevent IP spoofin from DDos attacks. If using asymmetric routing
-        or other complicated routing,t hen loose mode is recommended.
+	to prevent IP spoofing from DDos attacks. If using asymmetric routing
+        or other complicated routing, then loose mode is recommended.
 
 	conf/all/rp_filter must also be set to non-zero to do source validation
 	on the interface

