lua << EOF

-- clear cache so this reloads changes.
-- useful for development
package.loaded['onedark'] = nil
package.loaded['onedark.util'] = nil
package.loaded['onedark.colors'] = nil
package.loaded['onedark.theme'] = nil
package.loaded['onedark.config'] = nil

EOF
