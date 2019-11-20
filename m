From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Nov 2019 18:07:35 +0000
Subject: Re: [PATCH net] net: rtnetlink: prevent underflows in do_setvfinfo()
Message-Id: <20191120180735.GD5604@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191120123438.vxn2ngnxzpcaqot4@kili.mountain>
 <24d0482c-f23f-83b1-e79e-fb84694d0a54@gmail.com>
In-Reply-To: <24d0482c-f23f-83b1-e79e-fb84694d0a54@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Ahern <dsahern@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, Petr Machata <petrm@mellanox.com>, Jakub Kicinski <jakub.kicinski@netronome.com>, Nikolay Aleksandrov <nikolay@cumulusnetworks.com>, Parav Pandit <parav@mellanox.com>, Roopa Prabhu <roopa@cumulusnetworks.com>, Johannes Berg <johannes.berg@intel.com>, Michal Kubecek <mkubecek@suse.cz>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Nov 20, 2019 at 09:41:01AM -0700, David Ahern wrote:
> On 11/20/19 5:34 AM, Dan Carpenter wrote:
> > I reported this bug to the linux-rdma mailing list in April and this
> > patch wasn't considered very elegant.  I can see how that's true.  The
> > developer offered to write a fix which would update all the drivers to
> > use u32 throughout.  I reminded him in September that this bug still
> > needs to be fixed.
> 
> Since the uapi (ifla_vf_mac, ifla_vf_vlan, ...) all have u32, I agree
> with that comment -- it seems like the ndo functions should be changed
> from 'int vf' to 'u32 vf'.

It's a lot of changes and there is no way to be sure the static checker
isn't missing any bugs.

regards,
dan carpenter
