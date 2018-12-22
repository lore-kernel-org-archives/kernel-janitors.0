From: Al Viro <viro@zeniv.linux.org.uk>
Date: Sat, 22 Dec 2018 19:34:32 +0000
Subject: Re: [PATCH][next] smack: fix two memory leaks in smack_add_opt
Message-Id: <20181222193432.GC2217@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181222122750.13075-1-colin.king@canonical.com>
In-Reply-To: <20181222122750.13075-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Casey Schaufler <casey@schaufler-ca.com>, James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Dec 22, 2018 at 12:27:50PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently if s is null or when returning via the error exit label
> out_opt_err leaks of the allocated opts can occur. Fix the leak
> on the null s case by checking s is null before the allocation. Fix
> the leak on the exit path by checking if opts was allocated by
> kfree'ing opts.
> 
> Detected by CoverityScan, CID#1475953 ("Resource leak")
> 
> Fixes: b2130173efae ("smack: take the guts of smack_parse_opts_str() into a new helper")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

There's a better fix in local tree, will go into -next tonight.
