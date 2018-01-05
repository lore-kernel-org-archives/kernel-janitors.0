From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Fri, 05 Jan 2018 13:24:56 +0000
Subject: Re: [PATCH 12/12] power: reset: account for const type of of_device_id.data
Message-Id: <20180105132456.GD2614@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1514899688-27844-1-git-send-email-Julia.Lawall@lip6.fr>
 <1514899688-27844-13-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1514899688-27844-13-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On 02/01/2018 at 14:28:08 +0100, Julia Lawall wrote:
> This driver creates a const structure that it stores in the data
> field of an of_device_id array.
> 
> Add const to the declaration of the location that receives a value
> from the data field to ensure that the compiler will continue to check
> that the value is not modified and remove the const-dropping cast on
> the access to the data field.
> 
> Done using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>


-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
