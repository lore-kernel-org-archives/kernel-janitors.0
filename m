From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 Jan 2019 10:55:31 +0000
Subject: Re: [PATCH -next] mm: Mark 'stack_vm_area' with __maybe_unused
Message-Id: <20190102105531.GI3781@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545965190-2381-1-git-send-email-yuehaibing@huawei.com>
 <20181228085804.GR16738@dhcp22.suse.cz>
In-Reply-To: <20181228085804.GR16738@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Hocko <mhocko@kernel.org>
Cc: YueHaibing <yuehaibing@huawei.com>, Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, Marcos Paulo de Souza <marcos.souza.org@gmail.com>, David Windsor <dave@nullcore.net>, Roman Gushchin <guro@fb.com>, Andrew Morton <akpm@linux-foundation.org>, "Eric W. Biederman" <ebiederm@xmission.com>, Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Dec 28, 2018 at 09:58:04AM +0100, Michal Hocko wrote:
> On Fri 28-12-18 02:46:30, YueHaibing wrote:
> > Fixes gcc '-Wunused-but-set-variable' warning when
> > CONFIG_VMAP_STACK is not set:
> 
> Isn't this warning disabled? I can see the following
> # These warnings generated too much noise in a regular build.
> # Use make W=1 to enable them (see scripts/Makefile.extrawarn)
> KBUILD_CFLAGS += -Wno-unused-but-set-variable
> 
> in the main makefile. IMHO this warning doesn't really give us much.
> 

It would be nice to enable that warning.  YueHaibing and Colin King have
been whittling away at the problematic code...

YueHaibing, how many of these warnings do we have remaining on an
allmodoconfig?

regards,
dan carpenter
