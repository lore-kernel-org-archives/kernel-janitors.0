From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 23 Mar 2008 09:03:09 +0000
Subject: Re: any local implementations of linked lists?
Message-Id: <20080323090309.GB4216@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.00.0803230232220.1223@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.00.0803230232220.1223@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Mar 23, 2008 at 09:06:12AM +0100, Julia Lawall wrote:
> There are a lot of occurrences of structures that have a field of type 
> pointer to the structure, often with the suggestive name "next".  But at 
> least some of them have only a next field and no prev field.

Which suggests that they're single-linked lists on purpose.

