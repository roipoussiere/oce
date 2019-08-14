FROM cadquery/oce:prebuild

LABEL source="https://github.com/CadQuery/oce/tree/master" \
      issues="https://github.com/CadQuery/oce/issues" \
      license="https://github.com/CadQuery/oce/blob/master/LICENSE_LGPL_21.txt"

RUN cd cmake-build && \
    make -j$(nproc)

RUN cd cmake-build && \
    make install/strip

RUN cd cmake-build && \
    make test
