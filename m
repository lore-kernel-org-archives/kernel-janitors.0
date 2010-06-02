From: James Morris <jmorris@namei.org>
Date: Wed, 02 Jun 2010 01:56:36 +0000
Subject: Re: [patch] smack: opt_dentry is never null in in
Message-Id: <alpine.LRH.2.00.1006021156230.12305@tundra.namei.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100601071404.GH5483@bicker>
In-Reply-To: <20100601071404.GH5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Casey Schaufler <casey@schaufler-ca.com>, "David P. Quigley" <dpquigl@tycho.nsa.gov>, David Howells <dhowells@redhat.com>, Serge Hallyn <serue@us.ibm.com>, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 1 Jun 2010, Dan Carpenter wrote:

> This patch removes some unneeded code for if opt_dentry is null because
> that can never happen.
> 
> The function dereferences "opt_dentry" earlier when it checks 
> "if (opt_dentry->d_parent = opt_dentry) {".  That code was added in
> 2008.
> 
> This function called from security_d_instantiate().  I checked all the 
> places which call security_d_instantiate() and dentry is always non-null.
> I also checked the selinux version of this hook and there is a comment
> which says that dentry should be non-null if called from 
> d_instantiate().
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>


Applied to
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/security-testing-2.6#next

-- 
James Morris
<jmorris@namei.org>
