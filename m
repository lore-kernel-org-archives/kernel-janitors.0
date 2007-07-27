From: Al Viro <viro@ftp.linux.org.uk>
Date: Fri, 27 Jul 2007 09:59:05 +0000
Subject: Re: [PATCH 02/68] 0 -> NULL, for arch/arm
Message-Id: <20070727095905.GU27237@ftp.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707270944.LAA17082@ifs.emn.fr>
In-Reply-To: <200707270944.LAA17082@ifs.emn.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yoann Padioleau <padator@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, rmk@arm.linux.org.uk, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

On Fri, Jul 27, 2007 at 11:44:07AM +0200, Yoann Padioleau wrote:
>  		buf = alloc_safe_buffer(device_info, ptr, size, dir);
> -		if (buf = 0) {
> +		if (buf = NULL) {

		if (!buf)
surely...
