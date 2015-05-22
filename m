From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 May 2015 07:28:36 +0000
Subject: re: Extcon: support multiple states at a device.
Message-Id: <20150522072836.GA30507@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello MyungJoo Ham,

The patch 7eaf7186842c: ('extcon: Use the unique id for external
connector instead of string') from Apr 24, 2015, leads to the following
static checker warning:

	drivers/extcon/extcon.c:356 extcon_get_cable_state_()
	warn: we tested 'index < 0' before and it was 'false'

drivers/extcon/extcon.c
   343  /**
   344   * extcon_get_cable_state_() - Get the status of a specific cable.
   345   * @edev:       the extcon device that has the cable.
   346   * @id:         the unique id of each external connector in extcon enumeration.
   347   */
   348  int extcon_get_cable_state_(struct extcon_dev *edev, const enum extcon id)
   349  {
   350          int index;
   351  
   352          index = find_cable_index_by_id(edev, id);
   353          if (index < 0)
                    ^^^^^^^^^
Return error code here.

   354                  return index;
   355  
   356          if (index < 0 || (edev->max_supported && edev->max_supported <= index))
                    ^^^^^^^^^
No need to check here.

   357                  return -EINVAL;
   358  
   359          return !!(edev->state & (1 << index));
   360  }

But the other issue with this code is that the callers sometimes treat
errors as found, for example in extcon_get_cable_state().

regards,
dan carpenter
