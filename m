From: Nathan Chancellor <natechancellor@gmail.com>
Date: Tue, 17 Nov 2020 02:55:51 +0000
Subject: Re: [PATCH] mm: memcg: remove obsolete memcg_has_children()
Message-Id: <20201117025551.GA1103291@ubuntu-m3-large-x86>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201116055043.20886-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201116055043.20886-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Roman Gushchin <guro@fb.com>, Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, cgroups@vger.kernel.org, linux-mm@kvack.org, Michal Hocko <mhocko@kernel.org>, Vladimir Davydov <vdavydov.dev@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Nov 16, 2020 at 06:50:43AM +0100, Lukas Bulwahn wrote:
> Commit 2ef1bf118c40 ("mm: memcg: deprecate the non-hierarchical mode")
> removed the only use of memcg_has_children() in
> mem_cgroup_hierarchy_write() as part of the feature deprecation.
> 
> Hence, since then, make CC=clang W=1 warns:
> 
>   mm/memcontrol.c:3421:20:
>     warning: unused function 'memcg_has_children' [-Wunused-function]
> 
> Simply remove this obsolete unused function.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
