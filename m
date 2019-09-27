From: David Miller <davem@davemloft.net>
Date: Fri, 27 Sep 2019 16:14:38 +0000
Subject: Re: genetlink: prevent memory leak in netlbl_unlabel_defconf
Message-Id: <20190927.181438.1266274829431178042.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAHC9VhR+4pZObDz7kG+rxnox2ph4z_wpZdyOL=WmdnRvdQNH9A@mail.gmail.com>
        <c490685a-c7d6-5c95-5bf4-ed71f3c60cb6@web.de>
        <CAHC9VhRk8Gc_Yexrjz5uif+Vj7d+b=uMUytbrmbm2Yv+zoM05w@mail.gmail.com>
In-Reply-To: <CAHC9VhRk8Gc_Yexrjz5uif+Vj7d+b=uMUytbrmbm2Yv+zoM05w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paul@paul-moore.com
Cc: Markus.Elfring@web.de, navid.emamdoost@gmail.com, linux-security-module@vger.kernel.org, netdev@vger.kernel.org, emamd001@umn.edu, kjlu@umn.edu, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, smccaman@umn.edu

From: Paul Moore <paul@paul-moore.com>
Date: Fri, 27 Sep 2019 10:48:54 -0400

> From what I've seen the "Fixes" tag is typically used by people who
> are backporting patches, e.g. the -stable folks, to help decide what
> they need to backport.

Fixes: tags say what commit introduced the code being fixed, whether
it manifests in a real problem or not.

It has nothing directly to do with -stable and exists in it's own right
whether a change gets backported to -stable or not.
