From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 26 Aug 2007 11:15:44 +0000
Subject: possible power-of-2 cleanup
Message-Id: <Pine.LNX.4.64.0708260714110.24759@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  is anyone still working on the power-of-2 stuff?  surely, there's a
cleaner way to code this from fs/namespace.c:


        /*
         * Find the power-of-two list-heads that can fit into the allocation..
         * We don't guarantee that "sizeof(struct list_head)" is necessarily
         * a power-of-two.
         */
        nr_hash = PAGE_SIZE / sizeof(struct list_head);
        hash_bits = 0;
        do {
                hash_bits++;
        } while ((nr_hash >> hash_bits) != 0);
        hash_bits--;

        /*
         * Re-calculate the actual number of entries and the mask
         * from the number of bits we can fit.
         */
        nr_hash = 1UL << hash_bits;
        hash_mask = nr_hash - 1;


rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
