From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Mar 2015 13:13:10 +0000
Subject: Re: [PATCH v2] staging: vt6655: remove deprecated use of pci api
Message-Id: <20150320131310.GX10964@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1426856800-10920-1-git-send-email-lambert.quentin@gmail.com>
In-Reply-To: <1426856800-10920-1-git-send-email-lambert.quentin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Use the --in-reply-to option.  There were no responses to the first
version of this email so Greg is going to apply that one.  (I guess it's
still possible that someone will reply to it now, I suppose).

> ---
>  Changes since v1:
>    - Replaces GFP_ATOMIC by GFP_KERNEL since no lock is taken before calling
>      this function

This information about the locking should go in the commit message and
not under the cut-off.

regards,
dan carpenter

