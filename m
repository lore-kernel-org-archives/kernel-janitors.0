From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 04 May 2020 19:17:00 +0000
Subject: Re: [PATCH -next] selinux: fix error return code in policydb_read()
Message-Id: <20200504191700.GV2014@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200429073053.83660-1-weiyongjun1@huawei.com>
 <20200429130738.GQ2014@kadam>
 <CAHC9VhT1-rV3heNWxcKo58AVsvhGeX5=oTQY8d8uahpMhwbJrA@mail.gmail.com>
In-Reply-To: <CAHC9VhT1-rV3heNWxcKo58AVsvhGeX5=oTQY8d8uahpMhwbJrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Moore <paul@paul-moore.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Eric Paris <eparis@parisplace.org>, Ondrej Mosnacek <omosnace@redhat.com>, Jeff Vander Stoep <jeffv@google.com>, selinux@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, May 01, 2020 at 12:46:47PM -0400, Paul Moore wrote:
> On Wed, Apr 29, 2020 at 9:15 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > On Wed, Apr 29, 2020 at 07:30:53AM +0000, Wei Yongjun wrote:
> > > Fix to return negative error code -ENOMEM from the kvcalloc() error
> > > handling case instead of 0, as done elsewhere in this function.
> >
> > Please add a Fixes tag and Cc Kent.
> 
> Kent?  Who is Kent?

commit acdf52d97f824019888422842757013b37441dd1
Author: Kent Overstreet <kent.overstreet@gmail.com>
Date:   Mon Mar 11 23:31:10 2019 -0700

    selinux: convert to kvmalloc

regards,
dan carepnter
