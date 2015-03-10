From: Alexander Duyck <alexander.h.duyck@redhat.com>
Date: Tue, 10 Mar 2015 21:19:48 +0000
Subject: Re: fib_trie: Add tnode struct as a container for fields not needed in key_vector
Message-Id: <54FF5FF4.1010804@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150310210425.GA10841@mwanda>
In-Reply-To: <20150310210425.GA10841@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


On 03/10/2015 02:04 PM, Dan Carpenter wrote:
> Hello Alexander Duyck,
>
> The patch dc35dbeda3e0: "fib_trie: Add tnode struct as a container
> for fields not needed in key_vector" from Mar 6, 2015, leads to the
> following static checker warnings:
>
> net/ipv4/fib_trie.c:330 leaf_new() warn: variable dereferenced before check 'kv' (see line 328)
> net/ipv4/fib_trie.c:358 tnode_new() warn: variable dereferenced before check 'tnode' (see line 350)

These two I am aware of, they are both false errors.  I am not actually 
dereferencing so much as getting a pointer to an offset inside the 
structure.  Think of it as an inverse offsetof().

> net/ipv4/fib_trie.c:853 resize() error: we previously assumed 'tp' could be null (see line 835)
This one is a valid bug, I'll address it shortly.

> net/ipv4/fib_trie.c:1891 fib_trie_get_first() warn: variable dereferenced before check 't' (see line 1889)

This is another complaint about me dereferencing, likely due to the fact 
that it missed the fact that I am just getting the pointer to the array 
of size 1.  I don't actually perform the dereferencing until later when 
I use the "->" operator on the pointer.

- Alex


