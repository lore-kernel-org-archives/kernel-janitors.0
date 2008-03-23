From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Sun, 23 Mar 2008 09:40:11 +0000
Subject: Re: any local implementations of linked lists?
Message-Id: <alpine.LFD.1.00.0803230539020.5285@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.00.0803230232220.1223@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.00.0803230232220.1223@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 23 Mar 2008, Alexey Dobriyan wrote:

> On Sun, Mar 23, 2008 at 09:06:12AM +0100, Julia Lawall wrote:
> > There are a lot of occurrences of structures that have a field of type
> > pointer to the structure, often with the suggestive name "next".  But at
> > least some of them have only a next field and no prev field.
>
> Which suggests that they're single-linked lists on purpose.

right, i was going to mention that.  my original query related to
local implementations of linked lists that deserve to be replaced by
the in-kernel implementation, and that would normally apply only to
doubly-linked lists.

rday
--


====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
====================================
