From: James Morris <jmorris@namei.org>
Date: Sun, 06 Jun 2010 23:23:19 +0000
Subject: Re: [patch] KEYS: Propagate error code instead of returning
Message-Id: <alpine.LRH.2.00.1006070923020.22265@tundra.namei.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100603190911.GX5483@bicker>
In-Reply-To: <20100603190911.GX5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 3 Jun 2010, Dan Carpenter wrote:

> This is from a Smatch check I'm writing.
> 
> strncpy_from_user() returns -EFAULT on error so the first change just
> silences a warning but doesn't change how the code works.
> 
> The other change is a bug fix because install_thread_keyring_to_cred()
> can return a variety of errors such as -EINVAL, -EEXIST, -ENOMEM or 
> -EKEYREVOKED.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied to
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/security-testing-2.6#next

-- 
James Morris
<jmorris@namei.org>
