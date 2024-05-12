vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO frang75/nappgui_src
    REF "v${VERSION}"
    SHA512 3d8dc92d947e2ebaa17f07531b85fc0841ff62be249b39162aedec18297b9207347c6d7335365a8e020648b633ddd7460702502296e1eb3dc81f6ec65a2eab7b
    PATCHES
        fix-install-paths.patch
)

string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "dynamic" NAPPGUI_SHARED)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DNAPPGUI_DEMO=NO
        -DCMAKE_INSTALL_TYPE=vcpkg
        -DNAPPGUI_SHARED=${NAPPGUI_SHARED}
)

vcpkg_cmake_install()
vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

file(REMOVE "${CURRENT_PACKAGES_DIR}/bin/nrc.exe")
file(REMOVE "${CURRENT_PACKAGES_DIR}/bin/nrc.pdb")
file(REMOVE "${CURRENT_PACKAGES_DIR}/debug/bin/nrc.exe")
file(REMOVE "${CURRENT_PACKAGES_DIR}/debug/bin/nrc.pdb")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
