From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 04 Apr 2020 18:02:38 +0000
Subject: [bug report] ethtool: provide coalescing parameters with COALESCE_GET request
Message-Id: <20200404180238.GA173535@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Michal Kubecek,

The patch 217275453b3e: "ethtool: provide coalescing parameters with
COALESCE_GET request" from Mar 28, 2020, leads to the following
static checker warning:

	net/ethtool/coalesce.c:134 coalesce_put_u32()
	warn: signedness bug returning '(-90)'

net/ethtool/coalesce.c
   129  static bool coalesce_put_u32(struct sk_buff *skb, u16 attr_type, u32 val,
   130                               u32 supported_params)
   131  {
   132          if (!val && !(supported_params & attr_to_mask(attr_type)))
   133                  return false;
   134          return nla_put_u32(skb, attr_type, val);

This is done deliberately to return true on failure and false on
success but it causes a static checker warning.

   135  }
   136  
   137  static bool coalesce_put_bool(struct sk_buff *skb, u16 attr_type, u32 val,
   138                                u32 supported_params)
   139  {
   140          if (!val && !(supported_params & attr_to_mask(attr_type)))
   141                  return false;
   142          return nla_put_u8(skb, attr_type, !!val);

Same.

   143  }

regards,
dan carpenter
