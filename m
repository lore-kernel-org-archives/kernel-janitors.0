From: Paul Moore <paul@paul-moore.com>
Date: Wed, 17 Apr 2019 12:24:06 +0000
Subject: Re: [PATCH net] selinux: fix potential memory leak in selinux_socket_bind()
Message-Id: <CAHC9VhR+KqRNy740g-_Q1kajG2gFYah0nH0tgAxjVYk-NxtmmA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190417092600.161770-1-maowenan@huawei.com>
In-Reply-To: <20190417092600.161770-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: Stephen Smalley <sds@tycho.nsa.gov>, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Apr 17, 2019 at 5:15 AM Mao Wenan <maowenan@huawei.com> wrote:
>
> There might be memory leak if avc_has_perm() is failed after calling
> sel_netport_sid() or sel_netnode_sid(), port and node list must be deleted
> and freed firstly before it goto out.
> call trace:
> __sys_bind
>  security_socket_bind
>   selinux_socket_bind
>    sel_netport_sid
>    sel_netnode_sid
>
> Fixes: 3e11217263("SELinux: Add network port SID cache")
> Fixes: 88b7d370bb("selinux: fix address family in bind() and connect() to match address/port")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  security/selinux/hooks.c           | 15 +++++++++++----
>  security/selinux/include/netnode.h |  1 +
>  security/selinux/include/netport.h |  1 +
>  security/selinux/netnode.c         | 38 ++++++++++++++++++++++++++++++++++++++
>  security/selinux/netport.c         | 27 +++++++++++++++++++++++++++
>  5 files changed, 78 insertions(+), 4 deletions(-)

These are object label caches and as such it really isn't necessary,
or desirable, to remove entries.  Regardless of if the access is
allowed or not, the system is attempting to access these objects, and
likely to do so again, so having the object labels "hot" in the cache
is a performance win.

-- 
paul moore
www.paul-moore.com
