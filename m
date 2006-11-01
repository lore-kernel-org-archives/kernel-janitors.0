From: Andrew Morton <akpm@osdl.org>
Date: Wed, 01 Nov 2006 23:55:41 +0000
Subject: Re: [KJ] [PATCH] Correct misc_register return code handling in
Message-Id: <20061101155541.1e88a2f3.akpm@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061023171910.GA23714@hmsreliant.homelinux.net>
	<1161660875.10524.535.camel@localhost.localdomain>
	<20061024125306.GA1608@hmsreliant.homelinux.net>
	<1161729762.10524.660.camel@localhost.localdomain>
	<20061101135619.GA3459@hmsreliant.homelinux.net>
In-Reply-To: <20061101135619.GA3459@hmsreliant.homelinux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neil Horman <nhorman@tuxdriver.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, kernel-janitors@lists.osdl.org, kjhall@us.ibm.com, maxk@qualcomm.com, linux-kernel@vger.kernel.org

On Wed, 1 Nov 2006 08:56:19 -0500
Neil Horman <nhorman@tuxdriver.com> wrote:

> 	Since Andrew hasn't incorporated this patch yet, and I had the time, I
> redid the patch taking Benjamin's INIT_LIST_HEAD and Joes mmtimer cleanup into
> account.  New patch attached, replacing the old one, everything except the
> aforementioned cleanups is identical.  

Please prepare a description for this patch.  The INIT_LIST_HEAD() in
misc_register() is mysterious.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
