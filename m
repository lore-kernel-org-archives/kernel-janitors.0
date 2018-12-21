From: Al Viro <viro@zeniv.linux.org.uk>
Date: Fri, 21 Dec 2018 16:36:54 +0000
Subject: Re: [PATCH] smack: Fix a memory leak in smack_add_opt()
Message-Id: <20181221163654.GY2217@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181221090958.GE2735@kadam>
In-Reply-To: <20181221090958.GE2735@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Casey Schaufler <casey@schaufler-ca.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Dec 21, 2018 at 12:09:58PM +0300, Dan Carpenter wrote:
> The function is leaking "opts" on the error paths.
> 
> Fixes: 90e3b564ab93 ("smack: take the guts of smack_parse_opts_str() into a new helper")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

D'oh...  Applied, thanks for spotting that braino.
