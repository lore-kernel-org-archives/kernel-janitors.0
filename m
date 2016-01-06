From: Jiri Pirko <jiri@resnulli.us>
Date: Wed, 06 Jan 2016 10:15:47 +0000
Subject: Re: [patch -next] mlxsw: core: remove an unnecessary condition
Message-Id: <20160106101547.GB2295@nanopsycho.orion>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160106095630.GB23185@mwanda>
In-Reply-To: <20160106095630.GB23185@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Wed, Jan 06, 2016 at 10:56:30AM CET, dan.carpenter@oracle.com wrote:
>We checked "err" on the lines before so we know it's zero here.
>
>These cause a static checker warning because checking known things can
>indicate a bug.  Maybe there is a missing assignment or we are checking
>the wrong variable.
>
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Jiri Pirko <jiri@mellanox.com>
