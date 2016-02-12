From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 12 Feb 2016 20:45:15 +0000
Subject: re: memstick: add support for legacy memorysticks
Message-Id: <20160212204515.GA21611@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Maxim Levitsky,

The patch 0ab30494bc4f: "memstick: add support for legacy
memorysticks" from Sep 11, 2013, leads to the following static
checker warning:

	drivers/memstick/core/ms_block.c:84 msb_sg_copy()
	warn: should this be 'to_nents = -1'

drivers/memstick/core/ms_block.c
    40  static size_t msb_sg_copy(struct scatterlist *sg_from,
    41          struct scatterlist *sg_to, int to_nents, size_t offset, size_t len)
    42  {
    43          size_t copied = 0;
    44  
    45          while (offset > 0) {
    46                  if (offset >= sg_from->length) {
    47                          if (sg_is_last(sg_from))
    48                                  return 0;
    49  
    50                          offset -= sg_from->length;
    51                          sg_from = sg_next(sg_from);
    52                          continue;
    53                  }
    54  
    55                  copied = min(len, sg_from->length - offset);
    56                  sg_set_page(sg_to, sg_page(sg_from),
    57                          copied, sg_from->offset + offset);
    58  
    59                  len -= copied;
    60                  offset = 0;
    61  
    62                  if (sg_is_last(sg_from) || !len)
    63                          goto out;
    64  
    65                  sg_to = sg_next(sg_to);
    66                  to_nents--;
                        ^^^^^^^^^^^
    67                  sg_from = sg_next(sg_from);
    68          }
    69  
    70          while (len > sg_from->length && to_nents--) {

This is a post-op so we exit with to_nents = -1.  It feels like this
should be to_nents-- >= 0 because of the earlier decremenet.  Int the
worst case that seems like a harmless change which improves readiblity.

    71                  len -= sg_from->length;
    72                  copied += sg_from->length;
    73  
    74                  sg_set_page(sg_to, sg_page(sg_from),
    75                                  sg_from->length, sg_from->offset);
    76  
    77                  if (sg_is_last(sg_from) || !len)
    78                          goto out;
    79  
    80                  sg_from = sg_next(sg_from);
    81                  sg_to = sg_next(sg_to);
    82          }
    83  
    84          if (len && to_nents) {

This looks buggy.  It should probably as well be:

		if (len && to_nents >= 0) {

    85                  sg_set_page(sg_to, sg_page(sg_from), len, sg_from->offset);
    86                  copied += len;
    87          }
    88  out:
    89          sg_mark_end(sg_to);
    90          return copied;
    91  }

regards,
dan carpenter
