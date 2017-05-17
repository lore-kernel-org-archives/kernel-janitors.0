From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 17 May 2017 20:02:32 +0000
Subject: Re: [PATCH] ovl: potential Oops in ovl_rename()
Message-Id: <CAOQ4uxjAUrxGQJTX1ve0VXAnAZwcgytfdxPkoWHbwLvKbJeeKQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170517192903.eccqpknwlpd7axqb@mwanda>
In-Reply-To: <20170517192903.eccqpknwlpd7axqb@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, "open list:OVERLAY FILESYSTEM" <linux-unionfs@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, May 17, 2017 at 10:29 PM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> We can't do a "goto out_dput;" because "newdentry" isn't initialized
> yet.
>

Right. copy&paste typo.
Already posted a fix yesterday ("ovl: fix wrong error handling of
ovl_set_impure()")

Thanks!
