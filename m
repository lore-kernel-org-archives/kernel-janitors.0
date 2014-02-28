From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Feb 2014 13:42:39 +0000
Subject: re: ALSA: hda - Update CA0132 codec to load DSP firmware binary
Message-Id: <20140228134238.GA13812@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[ Not likely a bug.  Just confusing code ].

Hello Ian Minett,

The patch 01ef7dbffb41: "ALSA: hda - Update CA0132 codec to load DSP
firmware binary" from Sep 20, 2012, leads to the following static
checker warning:

	sound/pci/hda/patch_ca0132.c:2281 dspxfr_one_seg()
	warn: we tested 'hci_write' before and it was 'false'

sound/pci/hda/patch_ca0132.c
  2255          const struct dsp_image_seg *hci_write = NULL;
  2256          unsigned long timeout;
  2257          bool dma_active;
  2258  
  2259          if (fls = NULL)
  2260                  return -EINVAL;
  2261          if (is_hci_prog_list_seg(fls)) {
  2262                  hci_write = fls;
  2263                  fls = get_next_seg_ptr(fls);
  2264          }
  2265  
  2266          if (hci_write && (!fls || is_last(fls))) {

If fls->count = 0 and hci_write is non-zero then we return here.

  2267                  snd_printdd("hci_write\n");
  2268                  return dspxfr_hci_write(codec, hci_write);
  2269          }
  2270  
  2271          if (fls = NULL || dma_engine = NULL || port_map_mask = 0) {
  2272                  snd_printdd("Invalid Params\n");
  2273                  return -EINVAL;
  2274          }
  2275  
  2276          data = fls->data;
  2277          chip_addx = fls->chip_addr,
  2278          words_to_write = fls->count;

words_to_write is fls->count.

  2279  
  2280          if (!words_to_write)
  2281                  return hci_write ? dspxfr_hci_write(codec, hci_write) : 0;

If fls->count is zero then hci_write is zero so the test here is
redundant/confusing.  Were we intentending to test something else?  This
code is confusing.

  2282          if (reloc)
  2283                  chip_addx = (chip_addx & (0xFFFF0000 << 2)) + (reloc << 2);

regards,
dan carpenter
