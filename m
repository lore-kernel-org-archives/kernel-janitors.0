From: Marcel Holtmann <marcel@holtmann.org>
Date: Thu, 06 Aug 2009 20:14:02 +0000
Subject: Re: [PATCH 2/3] drivers/bluetooth: Add kmalloc NULL tests
Message-Id: <1249589642.21101.27.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908062204290.19100@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0908062204290.19100@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Julia,

> From: Julia Lawall <julia@diku.dk>
> 
> Check that the result of kmalloc is not NULL before dereferencing it.
> The patch also replaces kmalloc + memset by kzalloc.

good that this driver is not merged upstream yet. I apply the patch to
my tree. Thanks.

Regards

Marcel


