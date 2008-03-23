From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Sun, 23 Mar 2008 09:43:54 +0000
Subject: Re: any local implementations of linked lists?
Message-Id: <alpine.LFD.1.00.0803230543060.5307@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.00.0803230232220.1223@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.00.0803230232220.1223@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 23 Mar 2008, Julia Lawall wrote:

> The question still stands, though.  list_head has both next and prev
> fields.  Is it desirable to convert a singly linked list to a doubly
> linked list just for the benefit of using the functions in list.h,
> at a cost of more memory?

i'm guessing no.  given how many potential places there are for
converting *doubly* linked lists, i would leave singly linked lists
alone.

rday
--

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
====================================
