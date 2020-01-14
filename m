From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Jan 2020 06:27:56 +0000
Subject: [bug report] scripts/dtc: Update to upstream version v1.5.0-23-g87963ee20693
Message-Id: <20200114062756.rrjqh3pdguensgyq@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Rob Herring,

The patch 9bb9c6a110ea: "scripts/dtc: Update to upstream version
v1.5.0-23-g87963ee20693" from Jun 12, 2019, leads to the following
static checker warning:

	lib/../scripts/dtc/libfdt/fdt_addresses.c:76 fdt_appendprop_addrrange()
	warn: integer overflow (literal): u32max + 1

lib/../scripts/dtc/libfdt/fdt_addresses.c
    57  int fdt_appendprop_addrrange(void *fdt, int parent, int nodeoffset,
    58                               const char *name, uint64_t addr, uint64_t size)
    59  {
    60          int addr_cells, size_cells, ret;
    61          uint8_t data[sizeof(fdt64_t) * 2], *prop;
    62  
    63          ret = fdt_address_cells(fdt, parent);
    64          if (ret < 0)
    65                  return ret;
    66          addr_cells = ret;
    67  
    68          ret = fdt_size_cells(fdt, parent);
    69          if (ret < 0)
    70                  return ret;
    71          size_cells = ret;
    72  
    73          /* check validity of address */
    74          prop = data;
    75          if (addr_cells = 1) {
    76                  if ((addr > UINT32_MAX) || ((UINT32_MAX + 1 - addr) < size))
                                                     ^^^^^^^^^^^^^^
UINT32_MAX + 1 is zero.

    77                          return -FDT_ERR_BADVALUE;
    78  
    79                  fdt32_st(prop, (uint32_t)addr);
    80          } else if (addr_cells = 2) {
    81                  fdt64_st(prop, addr);
    82          } else {
    83                  return -FDT_ERR_BADNCELLS;
    84          }
    85  
    86          /* check validity of size */
    87          prop += addr_cells * sizeof(fdt32_t);
    88          if (size_cells = 1) {

regards,
dan carpenter
