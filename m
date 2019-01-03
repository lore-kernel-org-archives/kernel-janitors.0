From: Michal Hocko <mhocko@kernel.org>
Date: Thu, 03 Jan 2019 15:32:09 +0000
Subject: Re: [PATCH -next] mm: Mark 'stack_vm_area' with __maybe_unused
Message-Id: <20190103153209.GT31793@dhcp22.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545965190-2381-1-git-send-email-yuehaibing@huawei.com>
 <20181228085804.GR16738@dhcp22.suse.cz>
 <20190102105531.GI3781@kadam>
 <ae41ee4b-4e3f-d39b-1ad8-40d0096b713d@huawei.com>
In-Reply-To: <ae41ee4b-4e3f-d39b-1ad8-40d0096b713d@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, Marcos Paulo de Souza <marcos.souza.org@gmail.com>, David Windsor <dave@nullcore.net>, Roman Gushchin <guro@fb.com>, Andrew Morton <akpm@linux-foundation.org>, "Eric W. Biederman" <ebiederm@xmission.com>, Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed 02-01-19 19:40:15, YueHaibing wrote:
> On 2019/1/2 18:55, Dan Carpenter wrote:
> > On Fri, Dec 28, 2018 at 09:58:04AM +0100, Michal Hocko wrote:
> >> On Fri 28-12-18 02:46:30, YueHaibing wrote:
> >>> Fixes gcc '-Wunused-but-set-variable' warning when
> >>> CONFIG_VMAP_STACK is not set:
> >>
> >> Isn't this warning disabled? I can see the following
> >> # These warnings generated too much noise in a regular build.
> >> # Use make W=1 to enable them (see scripts/Makefile.extrawarn)
> >> KBUILD_CFLAGS += -Wno-unused-but-set-variable
> >>
> >> in the main makefile. IMHO this warning doesn't really give us much.
> >>
> > 
> > It would be nice to enable that warning.  YueHaibing and Colin King have
> > been whittling away at the problematic code...
> > 
> > YueHaibing, how many of these warnings do we have remaining on an
> > allmodoconfig?
> 
> about 1300+

This is way too much. Is any of them actually pointing to a real bug?

-- 
Michal Hocko
SUSE Labs
