From: Emil Goode <emilgoode@gmail.com>
Date: Wed, 06 Feb 2013 17:55:53 +0000
Subject: Re: [PATCH] batman-adv: Remove unused variable
Message-Id: <1360173353.22154.4.camel@debian>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1360168661-16871-1-git-send-email-emilgoode@gmail.com>
	 <20130206172234.GB6008@ritirata.org>
In-Reply-To: <20130206172234.GB6008@ritirata.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Antonio Quartulli <ordex@autistici.org>
Cc: lindner_marek@yahoo.de, siwu@hrz.tu-chemnitz.de, davem@davemloft.net, b.a.t.m.a.n@lists.open-mesh.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Antonio,

The commit ed242d01 is in the linux-next tree and my patch depends on
that commit.

Best regards, Emil

On Wed, 2013-02-06 at 18:22 +0100, Antonio Quartulli wrote:
> Hi Emil,
> 
> On Wed, Feb 06, 2013 at 05:37:41 +0100, Emil Goode wrote:
> > The commit ed242d01 removed a node parameter from iterators.
> > This patch removes a hlist_node struct that is no longer used.
> > 
> > Sparse gives a warning:
> > 
> > net/batman-adv/originator.c:411:21: warning:
> > 	unused variable ‘node_tmp’ [-Wunused-variable]
> > 
> > Signed-off-by: Emil Goode <emilgoode@gmail.com>
> 
> On which tree did you base your patch?
> I cannot find the commit you are referring to (ed242d01) and the patch does not
> apply (neither on net nor net-next).
> 
> Other than that the variable is used a couple of lines below (in the code we
> have)...
> 
> Regards,
> 


