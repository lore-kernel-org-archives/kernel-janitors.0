From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 09 Oct 2012 15:13:50 +0000
Subject: arch/powerpc/platforms/pseries/hotplug-memory.c:103:17: warning: unused variable 'pfn'
Message-Id: <20121009151350.GA11390@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Yasuaki,

FYI, there are new compile warnings show up in

commit: d760afd4d2570653891f94e13b848e97150dc5a6  memory-hotplug: suppress "Trying to free nonexistent resource <XXXXXXXXXXXXXXXX-YYYYYYYYYYYYYYYY>" warning
config: powerpc-allmodconfig

All warnings:

arch/powerpc/platforms/pseries/hotplug-memory.c: In function 'pseries_remove_memblock':
arch/powerpc/platforms/pseries/hotplug-memory.c:103:17: warning: unused variable 'pfn' [-Wunused-variable]

vim +103 arch/powerpc/platforms/pseries/hotplug-memory.c

04badfd2 Nathan Fontenot   2008-10-13   87  		return 0;
04badfd2 Nathan Fontenot   2008-10-13   88  	}
04badfd2 Nathan Fontenot   2008-10-13   89  
57b53926 Badari Pulavarty  2008-04-18   90  	zone = page_zone(pfn_to_page(start_pfn));
57b53926 Badari Pulavarty  2008-04-18   91  
57b53926 Badari Pulavarty  2008-04-18   92  	/*
57b53926 Badari Pulavarty  2008-04-18   93  	 * Remove section mappings and sysfs entries for the
57b53926 Badari Pulavarty  2008-04-18   94  	 * section of the memory we are removing.
57b53926 Badari Pulavarty  2008-04-18   95  	 *
57b53926 Badari Pulavarty  2008-04-18   96  	 * NOTE: Ideally, this should be done in generic code like
57b53926 Badari Pulavarty  2008-04-18   97  	 * remove_memory(). But remove_memory() gets called by writing
57b53926 Badari Pulavarty  2008-04-18   98  	 * to sysfs "state" file and we can't remove sysfs entries
57b53926 Badari Pulavarty  2008-04-18   99  	 * while writing to it. So we have to defer it to here.
57b53926 Badari Pulavarty  2008-04-18  100  	 */
d760afd4 Yasuaki Ishimatsu 2012-10-08  101  	sections_to_remove = (memblock_size >> PAGE_SHIFT) / PAGES_PER_SECTION;
d760afd4 Yasuaki Ishimatsu 2012-10-08  102  	for (i = 0; i < sections_to_remove; i++) {
d760afd4 Yasuaki Ishimatsu 2012-10-08 @103  		unsigned long pfn = start_pfn + i * PAGES_PER_SECTION;
d760afd4 Yasuaki Ishimatsu 2012-10-08  104  		ret = __remove_pages(zone, start_pfn,  PAGES_PER_SECTION);
d760afd4 Yasuaki Ishimatsu 2012-10-08  105  		if (ret)
d760afd4 Yasuaki Ishimatsu 2012-10-08  106  			return ret;
d760afd4 Yasuaki Ishimatsu 2012-10-08  107  	}
57b53926 Badari Pulavarty  2008-04-18  108  
57b53926 Badari Pulavarty  2008-04-18  109  	/*
98d5c21c Badari Pulavarty  2008-04-18  110  	 * Update memory regions for memory remove
98d5c21c Badari Pulavarty  2008-04-18  111  	 */

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
